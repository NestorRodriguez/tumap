import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalSuelosPage } from './modal-suelos.page';

describe('ModalSuelosPage', () => {
  let component: ModalSuelosPage;
  let fixture: ComponentFixture<ModalSuelosPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ModalSuelosPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ModalSuelosPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
