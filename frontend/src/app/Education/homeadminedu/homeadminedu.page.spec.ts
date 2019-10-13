import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HomeadmineduPage } from './homeadminedu.page';

describe('HomeadmineduPage', () => {
  let component: HomeadmineduPage;
  let fixture: ComponentFixture<HomeadmineduPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HomeadmineduPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HomeadmineduPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
