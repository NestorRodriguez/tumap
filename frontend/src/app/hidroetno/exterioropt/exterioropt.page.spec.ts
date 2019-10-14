import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ExterioroptPage } from './exterioropt.page';

describe('ExterioroptPage', () => {
  let component: ExterioroptPage;
  let fixture: ComponentFixture<ExterioroptPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ExterioroptPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ExterioroptPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
