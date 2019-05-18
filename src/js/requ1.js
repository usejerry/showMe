require.config({

    paths: {
        'jquery': 'jquery-1.11.0.min',
        'common': 'common',
        'header_title': 'header_title',
        'car': 'car'

    },
    shim: {
        'header_title': { deps: ['jquery', 'common'] },
        'car': { deps: ['jquery', 'common', 'header_title'] }
    }

});


requirejs(['jquery', 'common', 'header_title', 'car'], function () {

})



