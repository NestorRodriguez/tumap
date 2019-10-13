import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MapadminPage } from './mapadmin.page';

describe('MapadminPage', () => {
  let component: MapadminPage;
  let fixture: ComponentFixture<MapadminPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MapadminPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MapadminPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
