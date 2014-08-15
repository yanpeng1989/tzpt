/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


define(function(require, exports, module) {
    var View = require('famous/core/View');
    var Surface = require('famous/core/Surface');
    var ContainerSurface = require('famous/surfaces/ContainerSurface');
    var Modifier = require('famous/core/Modifier');
    
    var DragTable = function(dataSource) {
        ContainerSurface.apply(this, arguments);
        this.dataSource = dataSource;
        
    };
    
    function _initUI() {
        for(var i in this.dataSource) {
            var item = this.dataSource[i];
            
        }
    }
    DragTable.prototype = Object.create(View.prototype);
    DragTable.prototype.constructor = DragTable;
});