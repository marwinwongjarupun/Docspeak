(function($) {
    // Define the preloader plugin with customizable options
    $.fn.preloader = function(options) {
        // Extend the default settings with user-provided options
        var settings = $.extend({
            selector: '#preloader', // The preloader element selector
            type: 'document',       // Type of preloader; this example doesn't use it but is kept for potential future use
            removeType: 'fade',     // Removal method: 'fade' or 'remove'
            fadeDuration: 750,      // Duration of fade effect in milliseconds
            delay: 1500             // Delay before preloader is removed, in milliseconds
        }, options);

        // Preloader functionality, showing and hiding the preloader based on settings
        return this.each(function() {
            var $preloader = $(settings.selector);
            setTimeout(function() {
                if (settings.removeType === 'fade') {
                    $preloader.fadeOut(settings.fadeDuration);
                } else {
                    $preloader.remove();
                }
            }, settings.delay);
        });
    };

    // Auto-initialize the preloader when the window loads
    $(window).on('load', function() {
        $(this).preloader(); // You can pass custom options to the preloader here
    });

})(jQuery);
