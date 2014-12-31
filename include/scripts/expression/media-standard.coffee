module.exports =
    template: """
    <div class="backlight"></div>
    <div class="image-holder" style="background-image: url('{{state.mediaUrlPrefix}}assets/images/{{entity.id}}/{{entity.visCue.src}}');"></div>
    """
