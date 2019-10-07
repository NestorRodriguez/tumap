import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SenalizacionPage } from './senalizacion.page';

describe('SenalizacionPage', () => {
  let component: SenalizacionPage;
  let fixture: ComponentFixture<SenalizacionPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SenalizacionPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SenalizacionPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
