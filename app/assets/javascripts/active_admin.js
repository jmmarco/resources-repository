//= require active_admin/base
//= require select2-full

$(document).ready(function(){

	$('.tagselect').each(function() {
        var placeholder = $(this).data('placeholder');
        var url = $(this).data('url');
        var saved = $(this).data('saved');
        $(this).select2({
        	width: '75%',
            tags: true,
            placeholder: placeholder,
            minimumInputLength: 1,
            initSelection : function(element, callback){
                saved && callback(saved);
            },
            ajax: {
                url: url,
                dataType: 'json',
                data:    function(term) { return { q: term }; },
                processResults: function(data) { return { results: data }; }
            },
            createSearchChoice: function(term, data) {
                if ($(data).filter(function() {
                    return this.name.localeCompare(term)===0;
                }).length===0) {
                    return { id: term, name: term };
                }
            },
            templateResult:    function(item, page){  return item.name; },
            templateSelection: function(item, page){  return item.name; }
        });
    });
})


