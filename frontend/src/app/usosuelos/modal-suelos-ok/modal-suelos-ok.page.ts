import { Component, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { Router } from '@angular/router';
import { Storage } from '@ionic/storage';

@Component({
  selector: 'app-modal-suelos-ok',
  templateUrl: './modal-suelos-ok.page.html',
  styleUrls: ['./modal-suelos-ok.page.scss'],
})
export class ModalSuelosOkPage implements OnInit {

  constructor(private view: ModalController,
              private router: Router,
              private storage: Storage) { }

  ngOnInit() {
    const result = this.returnHome();
    setTimeout(() => {
      this.view.dismiss(result);
    }, 3000);
  }
  dismiss() {

   }
  public returnHome() {
    this.storage.remove('subpoligono');
    this.router.navigateByUrl('/home');
   }
}
