###
# Effect Plugin:
# Perfect Scrollbar
# 
# Manifests a "perfect scrollbar" from the vendor library of that name
# 
###

# An effect plugin may contain a (params) argument but none is needed here.

module.exports = ->
    
    # check whether jQuery is loaded and the perfectScrollbar plugin is present
    if window.$ and window.$.fn.perfectScrollbar
        
        $('.dialog-holder').perfectScrollbar { suppressScrollX: true, includePadding: true }
        
        # always scroll the element to the top when the dialog content is refreshed
        $('.dialog-holder').scrollTop 0
