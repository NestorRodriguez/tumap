import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InfohabitantesPage } from './infohabitantes.page';

describe('InfohabitantesPage', () => {
  let component: InfohabitantesPage;
  let fixture: ComponentFixture<InfohabitantesPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InfohabitantesPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InfohabitantesPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
