import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { JydCategoriasPage } from './jyd-categorias.page';

describe('JydCategoriasPage', () => {
  let component: JydCategoriasPage;
  let fixture: ComponentFixture<JydCategoriasPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ JydCategoriasPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JydCategoriasPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
