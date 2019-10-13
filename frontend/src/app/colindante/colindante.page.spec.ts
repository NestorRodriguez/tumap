import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColindantePage } from './colindante.page';

describe('ColindantePage', () => {
  let component: ColindantePage;
  let fixture: ComponentFixture<ColindantePage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColindantePage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColindantePage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
