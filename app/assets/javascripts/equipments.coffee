# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('document').ready ->
	# window.alert "It's coffeescript"
	console.log "In document.ready"
	$('.display_barcode').on "click", ->
		# window.alert "id clicked"
		# window.alert "text of the element: "
		$("#barcode").JsBarcode this.textContent
	null
