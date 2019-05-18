require.config({

    paths: {
        'jquery': 'jquery-1.11.0.min',
        'common': 'common',
        'list': 'list',

    },
    shim: {

        'list': { deps: ['jquery', 'common'] },

    }

});


requirejs(['jquery', 'common', 'list'], function () {

})