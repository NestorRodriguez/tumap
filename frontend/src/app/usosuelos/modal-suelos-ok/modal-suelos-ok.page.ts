import { Component, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { Router } from '@angular/router';

@Component({
  selector: 'app-modal-suelos-ok',
  templateUrl: './modal-suelos-ok.page.html',
  styleUrls: ['./modal-suelos-ok.page.scss'],
})
export class ModalSuelosOkPage implements OnInit {

  constructor(private view: ModalController,
              private router: Router) { }

  ngOnInit() {
    setTimeout(() => {
      this.view.dismiss();
    }, 3000);
  }
  dismiss() {
    this.router.navigateByUrl('usosueloshome');
   }
}
