import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CvSaludPage } from './cv-salud.page';

describe('CvSaludPage', () => {
  let component: CvSaludPage;
  let fixture: ComponentFixture<CvSaludPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CvSaludPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CvSaludPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
