function validateFields() {
    var keywords = $('#keywords').val().trim();
    var date = $('#date').val();

    if (keywords.length > 0 || date) {
        $('#submit').prop('disabled', false);
    } else {
        $('#submit').prop('disabled', true);
    }
}