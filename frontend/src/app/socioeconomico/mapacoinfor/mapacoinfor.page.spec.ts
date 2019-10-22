import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MapacoinforPage } from './mapacoinfor.page';

describe('MapacoinforPage', () => {
  let component: MapacoinforPage;
  let fixture: ComponentFixture<MapacoinforPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MapacoinforPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MapacoinforPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
