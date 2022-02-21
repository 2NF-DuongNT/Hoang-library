const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)
import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css'
window.addEventListener('DOMContentLoaded', () => {
    $('.js-states').select2()
})
module.exports = environment