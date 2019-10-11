import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PredialPage } from './predial.page';

describe('PredialPage', () => {
  let component: PredialPage;
  let fixture: ComponentFixture<PredialPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PredialPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PredialPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
