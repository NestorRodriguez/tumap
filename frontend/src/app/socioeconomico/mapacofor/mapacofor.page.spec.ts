import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MapacoforPage } from './mapacofor.page';

describe('MapacoforPage', () => {
  let component: MapacoforPage;
  let fixture: ComponentFixture<MapacoforPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MapacoforPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MapacoforPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
