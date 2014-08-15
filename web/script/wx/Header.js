/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


define(function(require, exports, module) {
    var View = require('famous/core/View');
    var Surface = require('famous/core/Surface');
    var ContainerSurface = require('famous/surfaces/ContainerSurface');
    var Modifier = require('famous/core/Modifier');
    var GridLayout = require('famous/views/GridLayout');
    var Header = function() {
        View.apply(this, arguments);
        this.classes = ["grey-bg"];
        this.container = new ContainerSurface({
            classes: this.classes
        });
        this.grid = new GridLayout({
            dimensions: [3, 1]
        });
        this.leftContent = new Surface({
            size: [undefined, undefined]
        });
        this.titleContent = new Surface({
            content: "首页",
            properties: {
                color: "white",
                fontSize: "20px",
                textAlign: "center",
                lineHeight: "50px"
            }
        });
        this.rightContent = new Surface({
            size: [undefined, undefined]
        });
        this.surfaces = [this.leftContent, this.titleContent, this.rightContent];
        this.grid.sequenceFrom(this.surfaces);
        this.container.add(this.grid);
        this._add(this.container);

        this.titleContent.on("click", event);
    };
    var i = true;
    function event() {
        if (i) {
            window.toPage(new Surface({
                properties: {
                    backgroundColor: "red"
                }
            }));
        } else {
            window.backPage();
        }
        i = !i;
    }
    Header.prototype = Object.create(View.prototype);
    Header.prototype.constructor = Header;
    module.exports = Header;
});