import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MinatipomaterialdetailsPage } from './minatipomaterialdetails.page';

describe('MinatipomaterialdetailsPage', () => {
  let component: MinatipomaterialdetailsPage;
  let fixture: ComponentFixture<MinatipomaterialdetailsPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MinatipomaterialdetailsPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MinatipomaterialdetailsPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
