import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SincoboptPage } from './sincobopt.page';

describe('SincoboptPage', () => {
  let component: SincoboptPage;
  let fixture: ComponentFixture<SincoboptPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SincoboptPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SincoboptPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
