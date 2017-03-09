/**
 * Created by jafo on 17/3/9.
 */
var reg_exp = new RegExp('$','g');
var href = window.location.href
var id
if(href.indexOf('blog') != -1){
    id = document.getElementById('index');
}
else if(href.indexOf('tag') != -1){
    id = document.getElementById('tag');
}
else if(href.indexOf('_list') != -1){
    id = document.getElementById('list');
}
else if(href.indexOf('uploadfile') != -1){
    id = document.getElementById('up');
}
else if(href.indexOf('singin') != -1){
    id = document.getElementById('singin');
}
else if(href.indexOf('singup') != -1){
    id = document.getElementById('singup');
}

id.className = 'active';

