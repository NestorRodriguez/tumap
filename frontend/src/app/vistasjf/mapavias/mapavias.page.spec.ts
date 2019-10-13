import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MapaviasPage } from './mapavias.page';

describe('MapaviasPage', () => {
  let component: MapaviasPage;
  let fixture: ComponentFixture<MapaviasPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MapaviasPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MapaviasPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
