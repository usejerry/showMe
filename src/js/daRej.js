require.config({

    paths: {
        'jquery': 'jquery-1.11.0.min',
        'common': 'common',
        'header_title': 'header_title',
        'login': 'login',
        'car': 'car',
        'zoomsl': 'zoomsl.min',
        'goods': 'goods',
        'list': 'list',
        'reg': 'reg',


    },
    shim: {
        'header_title': { deps: ['jquery', 'common'] },
        'login': { deps: ['jquery', 'common'] },
        'zoomsl': { deps: ['jquery'] },
        'car': { deps: ['jquery', 'common', 'header_title'] },
        'goods': { deps: ['jquery', 'common', 'zoomsl', 'header_title'] },
        'list': { deps: ['jquery', 'common'] },
        'reg': { deps: ['jquery', 'common'] },
    }

});


requirejs(['jquery', 'common', 'header_title', 'car', 'login', 'reg', 'list', 'zoomsl', 'goods'], function () {

})



