import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { JydMapaPage } from './jyd-mapa.page';

describe('JydMapaPage', () => {
  let component: JydMapaPage;
  let fixture: ComponentFixture<JydMapaPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ JydMapaPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JydMapaPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
