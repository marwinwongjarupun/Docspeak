async function getMicrophone() {
    const userMedia = await navigator.mediaDevices.getUserMedia({
        audio: true,
    });

    return new MediaRecorder(userMedia);
}

async function openMicrophone(microphone, socket) {
    await microphone.start(500);

    microphone.onstart = () => {
        console.log("client: microphone opened");
    };

    microphone.onstop = () => {
        console.log("client: microphone closed");
    };

    microphone.ondataavailable = (e) => {
        const data = e.data;
        console.log("client: sent data to websocket");
        socket.send(data);
    };
}

async function closeMicrophone(microphone) {
    microphone.stop();
}

async function start(socket) {

    let microphone;

    console.log("client: waiting to open microphone");

    if (!microphone) {
        // open and close the microphone
        microphone = await getMicrophone();
        await openMicrophone(microphone, socket);
    } else {
        await closeMicrophone(microphone);
        microphone = undefined;
    }
}

async function getTempApiKey() {
    try {
        const response = await fetch('https://europe-west2-docspeakapp.cloudfunctions.net/generateTempApiKey');
        const data = await response.json();
        return data.temporaryKey;
    } catch (error) {
        console.error("Error fetching temporary API key:", error);
        throw new Error("Failed to fetch temporary API key");
    }
}

async function initializeAudioTranscription(model, language) {
    try {
        const key = await getTempApiKey();
        const { createClient } = deepgram;
        const _deepgram = createClient(key);

        const socket = _deepgram.listen.live({ model: model, language: language, smart_format: true });

        socket.on("open", async () => {
            console.log("client: connected to websocket");

            // Handle transcription results
            socket.on("Results", (data) => {
                console.log(data);

                const transcript = data.channel.alternatives[0].transcript;

                if (transcript !== "") {
                                        
                    // Dispatch a custom event with the transcription result
                    const transcriptionEvent = new CustomEvent('transcriptionReceived', { detail: transcript });
                    document.dispatchEvent(transcriptionEvent);
                }
            });

            // Handle other socket events as before
            socket.on("error", (e) => console.error(e));
            socket.on("warning", (e) => console.warn(e));
            socket.on("Metadata", (e) => console.log(e));
            socket.on("close", (e) => console.log(e));

            // Start the audio streaming
            await start(socket);
        });
    } catch (error) {
        console.error("Failed to initialize audio transcription:", error);
    }
}

window.addEventListener("load", async () => {
    await initializeAudioTranscription("nova-2-medical", "en");
});

