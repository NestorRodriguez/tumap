import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalSuelosOkPage } from './modal-suelos-ok.page';

describe('ModalSuelosOkPage', () => {
  let component: ModalSuelosOkPage;
  let fixture: ComponentFixture<ModalSuelosOkPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ModalSuelosOkPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ModalSuelosOkPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
