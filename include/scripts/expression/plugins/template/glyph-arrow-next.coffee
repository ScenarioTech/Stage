###
# Template Plugin:
# Glyph - Next Arrow
# 
# A SVG glyph arrow meant to indicate that the user is free to move forward to the next cue
# 
###

# A template plugin like this may contain (template, params) arguments but none are needed here.

module.exports = ->
    """
    <svg
        width="210"
        height="180"
        class="feature-glyphs"
        version="1.1"
    >
        <path
            id="next-arrow"
            style="fill-opacity:1;fill-rule:nonzero;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0"
            connector-curvature="0"
            d="m 113.83415,103.25775 v 43.60003 l 72.19976,-66.800308 -72.19976,-64.59996 v 38.60031 C 26.033898,54.057822 6.0338986,151.45774 6.0338986,151.45774 30.834312,107.45797 66.234346,103.25775 113.83415,103.25775 z"
        />
    </svg>
    """
