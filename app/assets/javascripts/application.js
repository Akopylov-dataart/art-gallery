// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require cropper/dist/cropper
//= require vue/dist/vue
//= require vue-resource/dist/vue-resource
//= require vee-validate/dist/vee-validate
//= require npm-dependencies
//= require select2-full
//= require canvas-to-blob.min
//= require_self
//= require artworks

Vue.use(Paginate);
Vue.use(VeeValidate);

Vue.http.interceptors.push(function(request, next) {
    request.headers.set('X-CSRF-Token', $('[name="csrf-token"]').attr('content'));
    next()

});

window.onload = function () {
    new Vue({
        el: '#app'
    });
};