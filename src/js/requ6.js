require.config({

    paths: {
        'jquery': 'jquery-1.11.0.min',
        'common': 'common',
        'lunkuo': 'lunkuo',
        'header_title': 'header_title',
        'index': 'index'
    },
    shim: {

        'lunkuo': { deps: ['jquery', 'common'] },
        'header_title': { deps: ['jquery', 'common'] },
        'index': { deps: ['jquery', 'common', 'lunkuo', 'header_title'] },
    }

});


requirejs(['jquery', 'common', 'header_title', 'lunkuo','index'], function () {

})