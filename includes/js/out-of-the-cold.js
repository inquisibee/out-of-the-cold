


function CustomizeableSelect() {
	var _self = this;

	_self.showCustom = function(e) {

    var value = $(e.target).val();

    if( value == 'other' ){
      $('#new' + $(e.target).attr('id')).removeClass('d-none');
    } else {
      $('#new' + $(e.target).attr('id')).not('.d-none').addClass('d-none').val('');
    }

	}

	_self.getModel = function() {
		var model = {
			selects: $('.customizeable'),
			submit: $('#submit'),
			form: $('#car')
		}
		return model;
	}

	_self.bind = function() {
		_self.model.selects.bind("change", _self.showCustom)
		_self.model.submit.bind("click", function(){
				// make sure if any of the selects are 'other' that they have value
				_self.model.selects.each( function(index){
					var other = $('#new' + $(this).attr('id'));
					if( $(this).val() == 'other' && other.val().length == 0 ){
						alert("Please make sure you provide a new value for 'other'");
						other.focus();
						return false;
					}
				});
				_self.model.form.submit();
				return true;
		})
	}

	_self.init = function() {

	}

	// Constructor
	_self.model = _self.getModel()
	_self.bind()
	_self.init()

}




$(document).ready(function() {
  // load the rich text editor
	$('.rich-text').summernote();
  // load any customizeable selects
  customizedSelects = new CustomizeableSelect();
});
