require.config({

    paths: {
        'jquery': 'jquery-1.11.0.min',
        'common': 'common',
        'login': 'login'
    },
    shim: {

        'login': { deps: ['jquery', 'common'] }
    }

});


requirejs(['jquery', 'common', 'login'], function () {

})
