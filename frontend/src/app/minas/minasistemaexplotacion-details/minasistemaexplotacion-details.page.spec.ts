import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MinasistemaexplotacionDetailsPage } from './minasistemaexplotacion-details.page';

describe('MinasistemaexplotacionDetailsPage', () => {
  let component: MinasistemaexplotacionDetailsPage;
  let fixture: ComponentFixture<MinasistemaexplotacionDetailsPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MinasistemaexplotacionDetailsPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MinasistemaexplotacionDetailsPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
