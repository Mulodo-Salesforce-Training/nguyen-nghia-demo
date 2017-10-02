var validatorSLDSplugin = (function(j$) {
    return {
        validate: function() {
            var error = false;
            var allInputs = j$(":input");
            j$(allInputs).each(function() {
                var isrequired = j$(this).attr("data-required");
                if (typeof isrequired != 'undefined') {
                    if (typeof j$(this).attr("id") != 'undefined') {
                        if (isrequired === 'true') {
                            if (j$('#' + j$(this).attr("id")).val().length == 0) {
                                error = true;
                                j$('#' + j$(this).attr("id")).parent().parent().removeClass("slds-has-error slds-is-required");
                                j$('#' + j$(this).attr("id")).next('span.slds-form-element__help').remove();
                                j$('#' + j$(this).attr("id")).parent().parent().addClass("slds-has-error slds-is-required");
                                j$('#' + j$(this).attr("id")).after('<span class="slds-form-element__help" id=""' + j$(this).attr("id") + '>' + j$(this).attr("data-fieldName") + ' is Required</span>');
                            } else {
                                j$('#' + j$(this).attr("id")).next('span.slds-form-element__help').remove();
                                j$('#' + j$(this).attr("id")).parent().parent().removeClass("slds-has-error slds-is-required");
                            }
                        }
                    }
                }
            });
            return error;
        },

        displayalert: function(errormessage,messagecssclass) {

            var notifycontainer = j$('<div/>', {
                id: 'failedId',
                class: 'slds notify-container'
            });

            var sldsthemecontainer = j$('<div/>', {
                class: messagecssclass,
                role: 'alert'
            });

            var sldsbutton = j$('<button/>', {
                class: 'slds-button slds-notify__close'
            });

            var SVG = j$('<svg/>', {
                class: 'slds-button__icon slds-button__icon--inverse',
            });

            var SVGUse = j$('<use/>');
            SVGUse.attr('xlink:href',imageURL);

            var spanclose = j$('<span/>', {
                class: 'slds-assistive-text',
                text: 'Close'
            });

            var messagediv = j$('<div/>', {
                id: 'message'
            });

            var h2tag = j$('<h2/>', {
                text: errormessage
            });

            j$('#messagewrapper').append(notifycontainer.append(sldsthemecontainer.append(sldsbutton.append(SVG.append(SVGUse)).append(spanclose)).append(messagediv.append(h2tag))));
            j$("#messagewrapper").html(j$("#messagewrapper").html());
        }
    };
})(jQuery);