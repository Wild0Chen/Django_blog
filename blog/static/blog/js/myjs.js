/**
 * Created by jafo on 17/3/9.
 */
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

if (null != id)
    id.className = 'active';


$(document).ready(function () {
    var $form = $('form')
    if ($('.errorlist').length == 0)
        $form.hide()
    else
        $('#comment_show').hide()

    $(document).click(function (event) {
        var $tar = $(event.target)
        if ($(event.target).closest('form').length > 0)
            return;
        else if ('comment_show' === $tar.attr('id')) {
            $form.show().find('#id_user_name').focus();
            $tar.hide();
            return;
        }
        $('form').hide();
        $('#comment_show').show();
    })
})

$(function () {
    $('#commit_btn_comment').click(function () {
        $('.errorlist').remove()
        if (data_check())
            return false
        $.post("/ajax_add_comment/", {
            user_name: $('#id_user_name').val(),
            user_email: $('#id_user_email').val(),
            body: $('#id_body').val(),
            article_id: $('#article_id').text()
        }, function (data, textStatus) {
            $('.comment-list').append(data);
            $('body').trigger('click');
            $('#id_user_name').val('');
            $('#id_user_email').val('');
            $('#id_body').val('');
            $('#length').text(parseInt($('#length').text()) + 1)
        })
        return false
    })
})

function data_check() {
    var error = 0
    $id = $('#id_user_name');
    $email = $('#id_user_email')
    $body = $('#id_body')

    if ('' === $id.val()) {
        $id.before('<p class="errorlist">不能为空</p>')
        error += 1
    }
    if ('' === $email.val()) {
        $email.before('<p class="errorlist">不能为空</p>')
        error += 1
    }
    else {
        if (-1 === $email.val().indexOf('@')) {
            $email.before('<p class="errorlist">邮箱格式不正确</p>')
            error += 1
        }
    }
    if ('' === $body.val()) {
        $body.before('<p class="errorlist">不能为空</p>')
        error += 1
    }
    if (!error)
        return false
    else
        return true
}

$(function () {
    $('.block-comment-show').hover(function () {
            $('.block-comment-show a').show()
        },
        function () {
            $('.block-comment-show a').hide()
        })
})


$(function () {
    $('.block-comment-show > p.text-right > a').click(function () {
        var $del_ele = $(this).closest('.comment-block')
        $.post('/ajax_del_comment/', {'comment_id': $(this).prev().text()}, function (data, textStatus) {
            if ('success' === textStatus) {
                $del_ele.remove()
            }
        })
        return false
    })
})