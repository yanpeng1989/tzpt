/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


define(function(require, exports, module) {
    var Engine = require("famous/core/Engine");
    var Surface = require("famous/core/Surface");
    var Transform = require("famous/core/Transform");
    var Easing = require("famous/transitions/Easing");
    var HeaderFooterLayout = require("famous/views/HeaderFooterLayout");
    var LightBox = require("famous/views/Lightbox");
    var Header = require("./Header");

    var mainContext = Engine.createContext();

    window.layout = new HeaderFooterLayout({
        headerSize: 50,
        footerSize: 50
    });
    window.layout.header.add(new Header());

    var lightboxOptions = {
        inOpacity: 1,
        outOpacity: 1,
        inTransform: Transform.translate(320, 0, 0),
        outTransform: Transform.translate(-320, 0, 1),
        inTransition: {duration: 400, curve: Easing.outBack},
        outTransition: {duration: 150, curve: Easing.easeOut}
    };

    window.lightbox = new LightBox(lightboxOptions);
    window.layout.content.add(window.lightbox);
    window.surfaces = [];
    window.toPage = function(surface) {
        window.surfaces.push(surface);
        lightboxOptions["inTransform"] = Transform.translate(320, 0, 0);
        lightboxOptions["outTransform"] = Transform.translate(-320, 0, 0);
        window.lightbox.setOptions(lightboxOptions);
        window.lightbox.show(surface);
    };
    window.backPage = function() {
        window.surfaces.pop();
        lightboxOptions["inTransform"] = Transform.translate(-320, 0, 0);
        lightboxOptions["outTransform"] = Transform.translate(320, 0, 0);
        window.lightbox.setOptions(lightboxOptions);
        window.lightbox.show(window.surfaces[window.surfaces.length - 1]);
    };
    toPage(new Surface({
        content: "hhh",
        properties: {
            backgroundColor: "blue"
        }
    }));
    
    mainContext.add(window.layout);
});