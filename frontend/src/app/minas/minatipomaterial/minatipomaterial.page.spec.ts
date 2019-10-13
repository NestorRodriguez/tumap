import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MinatipomaterialPage } from './minatipomaterial.page';

describe('MinatipomaterialPage', () => {
  let component: MinatipomaterialPage;
  let fixture: ComponentFixture<MinatipomaterialPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MinatipomaterialPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MinatipomaterialPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
