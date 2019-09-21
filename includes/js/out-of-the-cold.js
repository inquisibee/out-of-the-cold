


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
		}
		return model;
	}

	_self.bind = function() {
		_self.model.selects.bind("change", _self.showCustom)

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
