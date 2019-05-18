require.config({

    paths: {
        'jquery': 'jquery-1.11.0.min',
        'common': 'common',
        'zoomsl': 'zoomsl.min',
        'header_title': 'header_title',
        'goods': 'goods'
    },
    shim: {

        'zoomsl': { deps: ['jquery'] },
        'header_title': { deps: ['jquery', 'common'] },
        'goods': { deps: ['jquery', 'common', 'zoomsl'] }
    }

});


requirejs(['jquery', 'common', 'goods', 'header_title', 'zoomsl'], function () {

})