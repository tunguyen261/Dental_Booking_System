function onSelectedImage(element, serviceID) {
    const file = element.files[0];
    const reader = new FileReader();

    reader.onloadend = function () {
        $('#rendered_image_' + serviceID).attr("src", reader.result);
        $('#image_' + serviceID).val(reader.result);
    }

    reader.readAsDataURL(file);
}