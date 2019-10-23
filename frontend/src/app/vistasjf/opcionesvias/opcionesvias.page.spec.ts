import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OpcionesviasPage } from './opcionesvias.page';

describe('OpcionesviasPage', () => {
  let component: OpcionesviasPage;
  let fixture: ComponentFixture<OpcionesviasPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OpcionesviasPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OpcionesviasPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
