import { Component, OnInit } from '@angular/core';
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';
import { WebView } from '@ionic-native/ionic-webview/ngx';


@Component({
  selector: 'app-exterioropt',
  templateUrl: './exterioropt.page.html',
  styleUrls: ['./exterioropt.page.scss'],
})
export class ExterioroptPage implements OnInit {

  image: string;

  constructor(
    private camera: Camera,
    private webview: WebView
  ) { }

  tomarFoto() {
    const options: CameraOptions = {
      quality: 100,
      destinationType: this.camera.DestinationType.FILE_URI,
      encodingType: this.camera.EncodingType.JPEG,
      mediaType: this.camera.MediaType.PICTURE,
      sourceType: this.camera.PictureSourceType.CAMERA
    };
    this.camera.getPicture(options)
    .then((imageData) => {
      this.image = this.webview.convertFileSrc(imageData);
    }, (err) => {
      console.log(err);
    });
  }

  ngOnInit() {
  }
  segmentChanged( event ) {
    const valorSegmento = event.detail.value;
    console.log(event);
  }

}
