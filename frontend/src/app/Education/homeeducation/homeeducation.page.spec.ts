import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HomeeducationPage } from './homeeducation.page';

describe('HomeeducationPage', () => {
  let component: HomeeducationPage;
  let fixture: ComponentFixture<HomeeducationPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HomeeducationPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HomeeducationPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
