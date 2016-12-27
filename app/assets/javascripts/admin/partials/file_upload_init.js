App.pageLoad.push(function() {
  if ( !$('#fileupload').length ) return;

  // TODO: fix turbolinks event stacking on media upload
  // this destroy method doesn't seem to work.
  if ( $('#fileupload').data('blueimpFileupload') ) {
    $('#fileupload').fileupload('destroy');
  }

  $('#fileupload').fileupload({
    autoUpload: true,
    sequentialUploads: true,
  }).on('fileuploadstart', function (e) {
    $('#progress').removeClass('hidden').addClass('fade in');
  }).on('fileuploadprogressall', function (e, data) {
    var progress = parseInt( data.loaded / data.total * 100, 10 );
    $('#progress .progress-bar').css( 'width', progress + '%' );
  }).on('fileuploadcompleted', function(e, data) {
    var previewLink = $('.template-download .preview a').attr('href');
    var previewImageUrl = $('.template-download .preview img').attr('src');
    var previewHTML = '<div class="col-xs-4 col-sm-3 col-md-2"><a class="media-library-link" href="' + previewLink + '"><div class="media-library-image img-rounded" style="background-image: url(' + previewImageUrl + ')"></div></a></div>';

    $('.template-download').remove();
    $(previewHTML).prependTo( $('.media-library [data-infinite-load]') );

    // $('#progress').addClass('hidden');
  });
});
