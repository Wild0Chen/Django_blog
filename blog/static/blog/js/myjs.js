/**
 * Created by jafo on 17/3/9.
 */
var reg_exp = new RegExp('$', 'g');
var href = window.location.href
var id
if (href.indexOf('blog') != -1) {
    id = document.getElementById('index');
}
else if (href.indexOf('tag') != -1) {
    id = document.getElementById('tag');
}
else if (href.indexOf('_list') != -1) {
    id = document.getElementById('list');
}
else if (href.indexOf('uploadfile') != -1) {
    id = document.getElementById('up');
}
else if (href.indexOf('singin') != -1) {
    id = document.getElementById('singin');
}
else if (href.indexOf('singup') != -1) {
    id = document.getElementById('singup');
}

id.className = 'active';


$(document).ready(function () {
    $('#comment_show').click(function () {
        $('#comment_show').hide();
        $('#comment_form').show();
        $('#id_user_name').focus();
    })
})

$(document).ready(function () {
    $('#comment_form').hide();
    $(document).click(function () {
        if (document.activeElement.id != "id_user_name" &&
            document.activeElement.id != 'id_user_email' &&
            document.activeElement.id != 'id_body') {
            $('#comment_form').hide();
            $('#comment_show').show();
        }
    })
})

