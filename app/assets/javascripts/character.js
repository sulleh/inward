<script>
$('textarea').keyup(function() {
    var cs = $(this).val().length;
    $('#characters').text(cs);
});
</script>