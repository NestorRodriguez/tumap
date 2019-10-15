import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HogaroptPage } from './hogaropt.page';

describe('HogaroptPage', () => {
  let component: HogaroptPage;
  let fixture: ComponentFixture<HogaroptPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HogaroptPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HogaroptPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
