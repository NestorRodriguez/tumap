import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InventarioOtrosPage } from './inventario-otros.page';

describe('InventarioOtrosPage', () => {
  let component: InventarioOtrosPage;
  let fixture: ComponentFixture<InventarioOtrosPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InventarioOtrosPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InventarioOtrosPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
