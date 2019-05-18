require.config({

    paths: {
        'jquery': 'jquery-1.11.0.min',
        'common': 'common',
        'reg': 'reg',

    },
    shim: {

        'reg': { deps: ['jquery', 'common'] },

    }

});


requirejs(['jquery', 'common', 'reg'], function () {

})