import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InventarioPostesPage } from './inventario-postes.page';

describe('InventarioPostesPage', () => {
  let component: InventarioPostesPage;
  let fixture: ComponentFixture<InventarioPostesPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InventarioPostesPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InventarioPostesPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
